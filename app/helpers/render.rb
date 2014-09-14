require "tilt"
require "redcarpet"

class Netflam
  module Render
    def self.setup(app)
      app.settings[:render]           ||= {}
      app.settings[:render][:engine]  ||= "erb"
      app.settings[:render][:layout]  ||= "layout"
      app.settings[:render][:views]   ||= File.expand_path("views", Dir.pwd)
      app.settings[:render][:options] ||= {
        default_encoding: Encoding.default_external,
        ugly:             true
      }
    end

    def render(template, locals = {}, layout = settings[:render][:layout])
      res.write(view(template, locals, layout))
    end

    def view(template, locals = {}, layout = settings[:render][:layout])
      partial(layout, locals.merge(content: partial(template, locals)))
    end

    def partial(template, locals = {})
      _render(template_path(template), locals, settings[:render][:options])
    end

    def template_path(template)
      dir = settings[:render][:views]
      ext = settings[:render][:engine]

      return File.join(dir, "#{ template }.#{ ext }")
    end

    # @private Renders any type of template file supported by Tilt.
    #
    # @example
    #
    #   # Renders home, and is assumed to be HAML.
    #   _render("home.haml")
    #
    #   # Renders with some local variables
    #   _render("home.haml", site_name: "My Site")
    #
    #   # Renders with HAML options
    #   _render("home.haml", {}, ugly: true, format: :html5)
    #
    #   # Renders in layout
    #   _render("layout.haml") { _render("home.haml") }
    #
    def _render(template, locals = {}, options = {}, &block)
      _cache.fetch(template) {
        Tilt.new(template, 1, options.merge(outvar: '@_output'))
      }.render(self, locals, &block)
    end

    # @private Used internally by #_render to cache the
    #          Tilt templates.
    def _cache
      Thread.current[:_cache] ||= Tilt::Cache.new
    end
  end

  module Markdown
    render_options = {
        # will remove from the output HTML tags inputted by user
        filter_html:     true,
        # will insert <br /> tags in paragraphs where are newlines
        hard_wrap:       true,
        # hash for extra link options, for example 'nofollow'
        link_attributes: { rel: 'nofollow' },
        # Prettify
        prettify:        true
    }

    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
        #will parse links without need of enclosing them
        autolink:           true,
        # blocks delimited with 3 ` or ~ will be considered as code block.
        # No need to indent.  You can provide language name too.
        # ```ruby
        # block of code
        # ```
        fenced_code_blocks: true,
        # will ignore standard require for empty lines surrounding HTML blocks
        lax_spacing:        true,
        # will not generate emphasis inside of words, for example no_emph_no
        no_intra_emphasis:  true,
        # will parse strikethrough from ~~, for example: ~~bad~~
        strikethrough:      true,
        # will parse superscript after ^, you can wrap superscript in ()
        superscript:        true
        # will require a space after # in defining headers
        # space_after_headers: true
    }

    @redcarpet = Redcarpet::Markdown.new(renderer, extensions = {})

    class << self
      def render(object)
        @redcarpet.render(object)
      end
    end
  end
end
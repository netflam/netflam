# TAGS CONTROLLER                                                           ---
#
# Version:                             controllers/tags.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

class Netflam
  module Controller
    class Tags < Netflam; end

    Tags.define do
      # get /t/:name
      # -------------------------------------------------------------------- */
      on ":name" do |name|
        # get /t/:name?page=:page
        # ------------------------------------------------------------------ */
        on param("page", true) do |page|
          @stories = Story.joins(:tags).where(tags: {name: [name]}).recent
          @stories = Netflam::Pagination.page(@stories, page)

          render("tag", { :title => name })
        end

        # get /t/:name
        # ------------------------------------------------------------------ */
        on true do
          @stories = Story.joins(:tags).where(tags: {name: [name]}).recent
          @stories = Netflam::Pagination.page(@stories, 1)

          render("tag", { :title => name })
        end
      end
    end
  end
end
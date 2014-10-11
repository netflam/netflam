# FUNCTIONS                                                                 ---
#
# Version:                            helpers/functions.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

require "redcarpet/render_strip"

class Netflam
  module Functions
    class << self
      def ago(from_time, to_time = Time.now.to_i, include_seconds = false)
        distance_in_minutes = (((to_time - from_time).abs)/60).round
        distance_in_seconds = ((to_time - from_time).abs).round

        case distance_in_minutes
          when 0..1
            return (distance_in_minutes==0) ? 'less than a minute ago' : '1 minute ago' unless include_seconds
            case distance_in_seconds
              when 0..5   then 'less than 5 seconds ago'
              when 6..10  then 'less than 10 seconds ago'
              when 11..20 then 'less than 20 seconds ago'
              when 21..40 then 'half a minute ago'
              when 41..59 then 'less than a minute ago'
              else             '1 minute ago'
            end

            when 2..45           then "#{distance_in_minutes} minutes ago"
            when 46..90          then 'about 1 hour ago'
            when 90..1440        then "about #{(distance_in_minutes / 60).round} hours ago"
            when 1441..2880      then '1 day ago'
            when 2881..43220     then "#{(distance_in_minutes / 1440).round} days ago"
            when 43201..86400    then 'about 1 month ago'
            when 86401..525960   then "#{(distance_in_minutes / 43200).round} months ago"
            when 525961..1051920 then 'about 1 year ago'
          else                      "over #{(distance_in_minutes / 525600).round} years ago"
        end
      end

      # I'm not suggesting this is particularly sane, but it works.
      #
      # The little bit of regex fixes cases where two paragraphs get squished
      # together and you end up with the unsightly
      #
      #   "end of sentence.New sentence"
      #
      # when you want
      #
      #   "end of sentence. New sentence"
      #
      # (I'm sure there are *loads* of edge-cases it will break on, but
      # this sort of handles some common cases, including various bits of
      # punctuation.)
      def truncate(extended, len = 20, ellipsis = "...")
          markdown  = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
          content   = markdown.render(extended).split " "
          truncated = content[0...len]

          truncated.join(" ").gsub(/([a-z])(\.|[\.\?\!]?[\'|\"]|\!|\?)([A-Z])/) {
              "#{$1}#{$2} #{$3}"
          } << ( content.size > len ? ellipsis : "" )
      end
    end
  end
end
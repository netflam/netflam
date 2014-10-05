# NOTIFICATION                                                              ---
#
# Version:                         helpers/notification.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

class Netflam
  module Notification
    @notifications  = :notifications

    @types = {
      'V' => 'new vote',
      'C' => 'new comment'
    }

    class << self
      def save(user_id, story_id, type)
        story = Story.find(story_id)
        users = Array.new

        # Commentators
        unless story.comments.nil? || story.comments.count == 0
          story.comments.each { |x| users.push(x.user_id) }
        end

        users = users.push(story.user_id) # Push author
        users = users.uniq                # Uniq
        users = users - [user_id]         # Remove provider

        unless users.nil?
          users.each do |user_id|
            list = Netflam::Notification.notify(user_id)
            $redis.hset(
              @notifications.to_s,
              user_id,
              list.push(story_id.to_s + type).to_s
            )
          end
        end
      end

      def any(user_id)
        list = Netflam::Notification.notify(user_id)

        if list.nil? || list.count == 0
          false
        else
          true
        end
      end

      def notify(user_id)
        string = $redis.hget(@notifications.to_s, user_id)

        if string.nil? || string.empty? || string.length > 0
          list = YAML.load(string.to_s)

          if list == false
            []
          else
            list.uniq
          end
        else
          []
        end
      end

      def type(letters)
        @types[letters]
      end

      def destroy(user_id)
        $redis.hdel(@notifications.to_s, user_id)
      end
    end
  end
end
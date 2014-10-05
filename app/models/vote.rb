# VOTE MODEL                                                                ---
#
# Version:                                  models/vote.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

class Vote < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  after_save     :votes_save
  after_destroy  :votes_destroy

  private
    def votes_save
      Netflam::Meter.save(story_id)
      Netflam::Notification.save(user_id, story_id, 'V')
    end

    def votes_destroy
      Netflam::Meter.destroy(story_id)
    end
end
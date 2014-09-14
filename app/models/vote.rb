class Vote < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  after_save     :votes_save
  after_destroy  :votes_destroy

  private
    def votes_save
      Netflam::Meter.save(story_id)
    end

    def votes_destroy
      Netflam::Meter.destroy(story_id)
    end
end
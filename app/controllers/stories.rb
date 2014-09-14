class Netflam
  module Controller
    class Stories < Netflam; end

    Stories.define do
      on "new" do
        # get /s/new
        # ------------------------------------------------------------------ */
        on get do
          render("new")
        end

        # post /s/new (url, description, extended, tags)
        # ------------------------------------------------------------------ */
        on post, param("url"), param("description"), param("extended"), param("tags") do |url, description, extended, tags|
          story = Story.new
          story.url = url
          story.description = description
          story.extended = extended

          tags.split(',').uniq.each do |name|
            tag = Tag.new
            tag.name = name
            story.tags << tag
          end

          if story.valid? == false
            @errors = story.errors.messages
            render("new")
          else
            session[:user].stories << story
            res.redirect "/recent"
          end
        end
      end

      on ":id" do |id|
        @story = Story.find(id.to_i(32))

        unless @story.nil? || @story == 0
          # get /s/:id/vote
          # ---------------------------------------------------------------- */
          on "vote" do
            if @story.user_id != session[:user].id
              if Vote.exists?(:user_id => session[:user].id, :story_id => @story.id)
                Vote.destroy_all(:user_id => session[:user].id, :story_id => @story.id)
              else
                Vote.create(:user_id => session[:user].id, :story_id => @story.id)
              end
            end
          end

          # get /s/:id/destroy
          # ---------------------------------------------------------------- */
          on "destroy" do
            if @story.user_id == session[:user].id
              Story.destroy(@story.id)
            end
          end

          on "edit" do
            # get /s/:id/edit
            # -------------------------------------------------------------- */
            on get do
              render("edit")
            end

            # post /s/:id/edit (url, description, extended, tags)
            # -------------------------------------------------------------- */
            on post, param("url"), param("description"), param("extended"), param("tags") do |url, description, extended, tags|
              story = @story
              story.url = url
              story.description = description
              story.extended = extended
              story.tags = [];

              tags.split(',').uniq.each do |name|
                tag = Tag.new
                tag.name = name
                story.tags << tag
              end

              if story.valid? == false
                @errors = story.errors.messages
                story = @story
                render("edit")
              else
                story.save
                res.redirect "/s/" + @story.id.to_s(32)
              end
            end
          end

          # get /s/:id
          # ---------------------------------------------------------------- */
          on true do
            render("read")
          end
        end
      end
    end
  end
end
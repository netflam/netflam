class Netflam
  module Controller
    class Comments < Netflam; end

    Comments.define do
      on "new" do
        # get /c/new
        # ------------------------------------------------------------------ */
        # on get do
        #   render("new")
        # end

        # post /c/new (id, extended)
        # ------------------------------------------------------------------ */
        on post, param("id"), param("extended") do |id, extended|
          story = Story.find(id.to_i(32))

          unless story.nil? || story == 0
            comment = Comment.new
            comment.user_id = session[:user].id
            comment.extended = extended
            story.comments << comment
          end
        end
      end

      on ":id" do |id|
        @comment = Comment.find(id.to_i(32))

        unless @comment.nil? || @comment == 0
          # get /c/:id/destroy
          # ---------------------------------------------------------------- */
          on "destroy" do
            if @comment.user_id == session[:user].id
              Comment.destroy(@comment.id)
            end
          end
        end
      end
    end
  end
end
# INDEX CONTROLLER                                                          ---
#
# Version:                            controllers/index.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

class Netflam
  module Controller
    class Index < Netflam; end

    Index.define do
      # get /
      # -------------------------------------------------------------------- */
      on root do
        # get /?page=:page
        # ------------------------------------------------------------------ */
        on param("page", true) do |page|
          hot      = Meter.top(0, 100)
          @stories = Story.find(hot).sort_by! {|s| hot.index s[:id]}
          # @stories = Netflam::Pagination.page(@stories, page)

          render("index", { :title => "popular" })
        end

        # get /
        # ------------------------------------------------------------------ */
        on true do
          hot      = Meter.top(0, 100)
          @stories = Story.find(hot).sort_by! {|s| hot.index s[:id]}
          # @stories = Netflam::Pagination.page(@stories, 1)

          render("index")
        end
      end

      # get /recent
      # -------------------------------------------------------------------- */
      on "recent" do
        # get /recent?page=:page
        # ------------------------------------------------------------------ */
        on param("page", true) do |page|
          @stories = Story.recent
          @stories = Netflam::Pagination.page(@stories, page)

          render("recent", { :title => "recent" })
        end

        # get /recent
        # ------------------------------------------------------------------ */
        on true do
          @stories = Story.recent
          @stories = Netflam::Pagination.page(@stories, 1)

          render("recent", { :title => "recent" })
        end
      end

      # get /comments
      # -------------------------------------------------------------------- */
      on "comments" do
        # get /comments?page=:page
        # ------------------------------------------------------------------ */
        on param("page", true) do |page|
          @comments = Comment.recent
          @comments = Netflam::Pagination.page(@comments, page)

          render("comments", { :title => "comments" })
        end

        # get /comments
        # ------------------------------------------------------------------ */
        on true do
          @comments = Comment.recent
          @comments = Netflam::Pagination.page(@comments, 1)

          render("comments", { :title => "comments" })
        end
      end

      # get /activity
      # -------------------------------------------------------------------- */
      on "activity" do
        @notifications = Netflam::Notification.notify(session[:user].id)
        @statistics = Hash.new(0)

        session[:user].stories.each do |story|
          @statistics[story.created_at.to_time.to_i] += 1
        end

        session[:user].comments.each do |comment|
          @statistics[comment.created_at.to_time.to_i] += 1
        end

        session[:user].votes.each do |vote|
          @statistics[vote.created_at.to_time.to_i] += 1
        end

        Netflam::Notification.destroy(session[:user].id)

        render("activity", { :title => "activity" })
      end

      # get /search
      # -------------------------------------------------------------------- */
      on "search" do
        # get /search?query=:query
        # ------------------------------------------------------------------ */
        on param("query", true) do |query|
          @stories = Story.where("url LIKE ? OR description LIKE ? OR extended LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
          @stories = Netflam::Pagination.page(@stories, 1)

          @comments = Comment.where("extended LIKE ?", "%#{query}%")
          @comments = Netflam::Pagination.page(@comments, 1)

          @query = query
          @pagination = false

          render("search", { :title => @query + ' - search' })
        end

        # get /search
        # ------------------------------------------------------------------ */
        on true do
          render("search", { :title => "search" })
        end
      end

      # get /terms
      # -------------------------------------------------------------------- */
      on "terms" do
        render("terms", { :title => "terms" })
      end

      # get /about
      # -------------------------------------------------------------------- */
      on "about" do
        render("about", { :title => "about" })
      end
    end
  end
end
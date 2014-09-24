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

          render("index")
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

          render("recent")
        end

        # get /recent
        # ------------------------------------------------------------------ */
        on true do
          @stories = Story.recent
          @stories = Netflam::Pagination.page(@stories, 1)

          render("recent")
        end
      end

      # get /comments
      # -------------------------------------------------------------------- */
      on "comments" do
        res.write "not ready!"
      end

      # get /search
      # -------------------------------------------------------------------- */
      on "search" do
        res.write "not ready!"
      end

      # get /terms
      # -------------------------------------------------------------------- */
      on "terms" do
        render("terms")
      end

      # get /about
      # -------------------------------------------------------------------- */
      on "about" do
        render("about")
      end
    end
  end
end
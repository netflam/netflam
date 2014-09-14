class Netflam
  module Controller
    class Index < Netflam; end

    Index.define do
      # get /
      # -------------------------------------------------------------------- */
      on root do
        hot = Meter.top(0, 100)
        @stories = Story.find(hot).sort_by! {|u| hot.index u[:id]}

        render("index")
      end

      # get /recent
      # -------------------------------------------------------------------- */
      on "recent" do
        @stories = Story.order("created_at DESC").limit(100)
        render("recent")
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
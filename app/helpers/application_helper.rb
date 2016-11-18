module ApplicationHelper
  def average_star(post)
    stars_array = []
    if !post.stars.empty?
      full_star = (post.stars.map(&:star_count).sum / post.stars.size.to_f).round
      full_star.times do
        stars_array.push(fa_icon('star'))
      end
      (5 - full_star).times do
        stars_array.push(fa_icon('star-o'))
      end
    else
      5.times do
        stars_array.push(fa_icon('star-o'))
      end
  end
    stars_array.join.html_safe
  end

  def display_star(post)
    if post.stars.find_by(user: current_user).nil?
      star = 0
      star_number = 0
    else
      star = post.stars.find_by(user: current_user)
      star_number = star.star_count
    end

    blank_star = star_number + 1

    method = if star == 0
               :post
             else
               :patch
                   end

    def path(post, star, count)
      if star == 0
        post_stars_path(post, star: { star_count: count })
      else
        star_path(star, star: { star_count: count })
      end
    end

    links_array = []

    1.upto(star_number) do |s|
      links_array << link_to(fa_icon('star'), path(post, star, s), method: method)
    end

    blank_star.upto(5) do |s|
      links_array << link_to(fa_icon('star-o'), path(post, star, s), method: method)
    end

    safe_join(links_array, '')
  end
end

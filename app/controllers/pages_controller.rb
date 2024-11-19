class PagesController < ApplicationController
  def home
    @dynamic_options = [
      "caillou avec de la personnalité",
      "ami qui ne parle pas trop",
      "copain en béton",
      "bout de nature portable",
      "gardien immobile",
      "compagnon en granite",
      "confident qui ne juge pas",
      "colocataire qui ne salit pas",
      "caillou rigolo",
      "rocher légendaire",
      "galet bavard",
      "ami minéral",
      "joyau oublié",
      "fragment antique",
      "trésor géologique",
      "compagnon solide",
      "vestige du passé",
      "bloc énigmatique",
      "fidèle copain",
      "mystère de granite",
      "héros rocailleux",
      "morceau de nature",
      "protecteur immobile",
      "joyeux roc",
      "solitaire silencieux",
      "fragment magique",
      "témoin du temps",
      "poids plume en pierre"
    ]
  end
  def profile
    @user = User.find_by(id: params[:id]) || User.find_by(username: params[:id])

    if @user
      # Optional: load additional user-related data here (e.g., posts, bookings, etc.)
    else
      redirect_to root_path, alert: "User not found"
    end
  end
end

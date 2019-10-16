# Preview all emails at http://localhost:3000/rails/mailers/pictures_mailer
class PicturesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pictures_mailer/name:string
  def name:string
    PicturesMailer.name:string
  end

  # Preview this email at http://localhost:3000/rails/mailers/pictures_mailer/email:string
  def email:string
    PicturesMailer.email:string
  end

end

class PhotosController < ApplicationController
  include Magick
  before_action :set_photo, only: %i[ show edit update destroy ]

  # GET /photos or /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1 or /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos or /photos.json
  def create
    @photo = Photo.new(photo_params)
    send(@photo.effect.gsub('-', '_'))

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: "Photo was successfully created." }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def photo_params
    params.require(:photo).permit(:original, :effect, :output_image)
  end

  def nothing
    @photo.output_image = photo_params[:original]
  end

  def waifu2x
    deepai
  end

  def torch_srgan
    deepai
  end

  def colorizer
    deepai
  end

  def toonify
    deepai
  end

  def deepdream
    deepai
  end

  def deepai
    r = RestClient::Request.execute(method: :post, url: "https://api.deepai.org/api/#{@photo.effect}", timeout: 600,
                                    headers: {'api-key' => ENV['DEEPAI_KEY'] },
                                    payload: { 'image' => File.new(file) })
    body = JSON.parse r.body
    @photo.output_image = body['output_url']
  end

  def blur_bg
     b=a.composite_layers(i,Magick::OverCompositeOp)
     b.write(file)
  end

  def blur
    @photo.save
    origin = ImageList.new(file)
    final = origin.blur_image(30.0, 30.0)
    final.write(file_result)
    @photo.output_image = photo_name
  end

  def remove_bg
    r = RemoveBg.from_file(file)
    @photo.save
    r.save(file_result)
    @photo.output_image = photo_name
  end

  def photo_name
    "results/#{@photo.id}_#{@photo.original}"
  end

  def file_result
    File.join(Rails.root, 'app', 'assets', 'images', photo_name)
  end

  def file
    File.join(Rails.root, 'app', 'assets', 'images', "#{@photo.original}")
  end
end

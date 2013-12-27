class ClientsController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @clients = Client.order("name").page(params[:page]).per(5)
  end
  
  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    puts current_user.to_s
    @client = current_user.clients.build(client_params)
    if @client.save
      flash[:success] = "Se ha creado el cliente #{@client.name}"
      redirect_to @client
    else
      render 'new'
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      flash[:success] = "Cliente Actualizado"
      redirect_to @client
    else
      render 'edit'
    end
  end

  def edit
    @client  = Client.find(params[:id])
  end

  def destroy
    Client.find(params[:id]).destroy
    flash[:success] = "Cliente borrado"
    redirect_to clients_url
  end

  private

    def client_params
      params.require(:client).permit(:name, :fullname,:ruc,
        :legalrepresentative, :address, :web, :tipo_contribuyente_id, :segmento_id)
    end
end

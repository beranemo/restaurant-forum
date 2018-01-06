class ReposController < ApplicationController
  
  def index
    @repos = Repo.all.order(sort: :desc)
  end
  
  def new
    @repo = Repo.new
  end
  
  def create
    @repo = Repo.new(repo_params)
    if @repo.save
      redirect_to repos_path
    else
      render :new
    end
  end
  
  def edit
    @repo = Repo.find(params[:id])
  end
  
  def update
    @repo = Repo.find(params[:id])
    if @repo.update(repo_params)
      redirect_to repos_path
    else
      render :edit
    end
  end
  
  def destroy
    @repo = Repo.find(params[:id])
    @repo.destroy
    redirect_to repos_path
  end
  
  private 
  
  def repo_params
    params.require(:repo).permit(
      :site_name,
      :site_url,
      :github_name,
      :github_url,
      :account,
      :password,
      :description,
      :sort
      )
  end

end

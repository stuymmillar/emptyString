class NumberSquare{
  private int xCor;
  private int yCor;
  private Boolean isClicked;
  
  public Square(int x, int y, int newState){
    xCor = x;
    yCor = y;
    isClicked = false;
  }
  
  public int getXCor(){
    return xCor;
  }
  
  public int getYCor(){
    return yCor;
  }
  
  public void reveal(){
    isClicked = true;
  }
}
class Square{
  private int xCor;
  private int yCor;
  private int state;
  private Boolean isClicked;
  
  public Square(int x, int y, int newState){
    xCor = x;
    yCor = y;
    state = newState;
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
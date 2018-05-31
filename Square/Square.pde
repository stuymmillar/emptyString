abstract class Square{
  private int xCor;
  private int yCor;
  private Boolean isClicked;
  
  public Square(int x, int y){}
  
  abstract int getXCor();
  
  abstract int getYCor();
  
  abstract void reveal();
}
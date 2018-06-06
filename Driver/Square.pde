class Square{
  final int SAFE = 0;
  final int MINE = 1;
  private float status = random( 0, 10 );
  private int xCor;
  private int yCor;
  private int state;
  private int number;
  private boolean isClicked;
 
  public Square()
  {
    xCor = 0;
    yCor = 0;
    isClicked = false;
    state = 0;
    number = 0;
    if( status <= 1 )
    {
      state = 1;
    }
    else
    {
      state = 0;
    }
  }
  
  public void update()
  {
    rect( xCor, yCor, 50, 50 );
    if( state == MINE )
    {
      PImage img = loadImage( "Mine.jpg" );
      image( img, xCor, yCor );
    }
  }
  
  public void setXCor( int newCor )
  {
    xCor = newCor;
  }
  
  public void setYCor( int newCor )
  {
    yCor = newCor;
  }
  
  public int getXCor()
  {
    return xCor;
  }
  
  public int getYCor()
  {
    return yCor;
  }
  
  public void reveal()
  {
    isClicked = true;
  }
  
}

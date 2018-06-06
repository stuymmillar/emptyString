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
  
  public void update1()
  {
    rect( xCor, yCor, 50, 50 );
  }
  
  public void update2()
  {
    if( state == 1 )
    {
      PImage img = loadImage( "Mine.jpg" );
      image( img, xCor, yCor );
    }
    else
    {
      if( number == 1 )
      {
        PImage img = loadImage( "One.jpg" );
        image( img, xCor, yCor );
      }
      else if( number == 2 )
      {
        PImage img = loadImage( "Two.jpg" );
        image( img, xCor, yCor );
      }
      else if( number == 3 )
      {
        PImage img = loadImage( "Three.jpg" );
        image( img, xCor, yCor );
      }
      else if( number == 4 )
      {
        PImage img = loadImage( "Four.jpg" );
        image( img, xCor, yCor );
      }
      else if( number == 5 )
      {
        PImage img = loadImage( "Five.jpg" );
        image( img, xCor, yCor );
      }
      else if( number == 6 )
      {
        PImage img = loadImage( "Six.jpg" );
        image( img, xCor, yCor );
      }
      else if( number == 7 )
      {
        PImage img = loadImage( "Seven.jpg" );
        image( img, xCor, yCor );
      }
      else if( number == 8 )
      {
        PImage img = loadImage( "Eight.jpg" );
        image( img, xCor, yCor );
      }
      else
      {
        return;
      }
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

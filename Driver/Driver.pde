Square[][] squares = new Square[ 16 ][ 16 ];
int xCor = 0;
int yCor = 0;

void setup()
{
  background( 0 );
  size( 800, 800 );
  for( int row = 0; row < 16; row++ ) // Set up mines
  {
    for( int col = 0; col < 16; col++ )
    {
      squares[ row ][ col ] = new Square();
      squares[ row ][ col ].setXCor( xCor );
      squares[ row ][ col ].setYCor( yCor );
      squares[ row ][ col ].update();
      xCor += 50;
    }
    xCor = 0;
    yCor += 50;
  }
  for( int row = 0; row < 16; row++ ) 
  { 
    for( int col = 0; col < 16; col++ ) 
    { 
      for( int rowOffs = -1; rowOffs <=1; rowOffs++ ) 
      {
        for( int colOffs = -1; colOffs <= 1; colOffs++ ) 
        {
          int posX = col + colOffs;
          int posY = row + rowOffs;
          if ( ( posY >= 0 ) && ( posY < 16 ) && 
               ( posX >= 0 ) && ( posX < 16 ) ||
               ( ( colOffs != 0 ) && ( rowOffs != 0 ) ) 
             ) 
          {
            if ( squares[ row ][ col ].state == 0 ) 
            {
              squares[row][col].number++;
            }
          }
        }
      }
    }
  }
  for( int row = 0; row < 16; row++ )
  {
    for( int col = 0; col < 16; col++ )
    {
      if( squares[ row ][ col ].state == 0 )
      {
        squares[ row ][ col ].getXCor();
        squares[ row ][ col ].getYCor();
        if( squares[ row ][ col ].number == 1 )
        {
          PImage img = loadImage( "One.jpg" );
          image( img, xCor, yCor );
        }
        else if( squares[ row ][ col ].number == 2 )
        {
          PImage img = loadImage( "Two.jpg" );
          image( img, xCor, yCor );
        }
        else if( squares[ row ][ col ].number == 3 )
        {
          PImage img = loadImage( "Three.jpg" );
          image( img, xCor, yCor );
        }
        else if( squares[ row ][ col ].number == 4 )
        {
          PImage img = loadImage( "Four.jpg" );
          image( img, xCor, yCor );
        }
        else if( squares[ row ][ col ].number == 5 )
        {
          PImage img = loadImage( "Five.jpg" );
          image( img, xCor, yCor );
        }
        else if( squares[ row ][ col ].number == 6 )
        {
          PImage img = loadImage( "Six.jpg" );
          image( img, xCor, yCor );
        }
        else if( squares[ row ][ col ].number == 7 )
        {
          PImage img = loadImage( "Seven.jpg" );
          image( img, xCor, yCor );
        }
        else if( squares[ row ][ col ].number == 8 )
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
  }
  
} // end setup()

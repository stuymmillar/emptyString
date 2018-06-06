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
  for( int row = 0; row < 16; row++ ) // Set up numbers
  {
    for( int col = 0; col < 16; col++ )
    {
      if( squares[ row ][ col ].state == 0 ) // If square is safe
      {
        if( row == 0 && col == 0 ) // If square is top left corner
        {
          if( squares[ row++ ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
        }
        else if( row == 0 && col == 15 ) // If square is top right corner
        {
          if( squares[ row++ ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
        }
        else if( row == 15 && col == 15 ) // If square is bottom right corner
        {
          if( squares[ row ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
        }
        else if( row == 15 && col == 0 ) // If square is bottom left corner
        {
          if( squares[ row-- ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
        }
        else if( row == 0 ) // If square is top row
        {
          if( squares[ row ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
        }
        else if( row == 15 ) // If square is bottom row
        {
          if( squares[ row ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
        }
        else if( col == 0 ) // If square is left column
        {
          if( squares[ row-- ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
        }
        else if( col == 15 ) // If square is right column
        {
          if( squares[ row-- ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
        }
        else if( row != 0 && row != 15 && col != 0 && col != 15 )
        {
          if( squares[ row-- ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row-- ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col++ ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row++ ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
          if( squares[ row ][ col-- ].state == 1 )
          {
            squares[ row ][ col ].number++;
          }
        }
      } // end if square is mine
    }
  }
} // end setup()

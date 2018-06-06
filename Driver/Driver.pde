Square[][] squares = new Square[ 16 ][ 16 ];
int xCor = 0;
int yCor = 0;
boolean reveal = false;
boolean flag = false;
boolean loop = false;

void setup()
{
  background( 0 );
  size( 800, 800 );
  for( int row = 0; row < 16; row++ ) // Set up squares
  {
    for( int col = 0; col < 16; col++ )
    {
      squares[ row ][ col ] = new Square();
      squares[ row ][ col ].setXCor( xCor );
      squares[ row ][ col ].setYCor( yCor );
      squares[ row ][ col ].update1();
      xCor += 50;
    }
    xCor = 0;
    yCor += 50;
  }
  for( int row = 0; row < 16; row++ ) // Get adjacent mines
  { 
    for( int col = 0; col < 16; col++ ) 
    { 
      for( int rowOffs = -1; rowOffs <= 1; rowOffs++ ) 
      {
        for( int colOffs = -1; colOffs <= 1; colOffs++ ) 
        {
          int posX = row + rowOffs;
          int posY = col + colOffs;
          if( posX != -1 && posY != -1 && posX != 16 && posY != 16 )
          {
            if( squares[ posX ][ posY ].state == 1 )
            {
              squares[ row ][ col ].number++;
            }
          }
        }
      }
    }
  }
} // end setup()

void mouseClicked()
{
  if( mouseButton == LEFT )
  {
    reveal = true;
  }
  else if( mouseButton == RIGHT )
  { //<>//
    flag = true;
  }
}

void draw()
{
  if( reveal == true )
  {
    for( int row = 0; row < 16; row++ )
    {
      for( int col = 0; col < 16; col++ )
      {
        if( ( mouseX >= squares[ row ][ col ].xCor ) &&
            ( mouseY >= squares[ row ][ col ].yCor ) &&
            ( mouseX <= squares[ row ][ col ].xCor + 50 ) &&
            ( mouseY <= squares[ row ][ col ].yCor + 50 ) &&
            ( squares[ row ][ col ].isClicked == false ) &&
            ( squares[ row ][ col ].isFlagged == false ) )
        {
          squares[ row ][ col ].update2();
          if( squares[ row ][ col ].state == 1 )
          {
            for( int r = 0; r < 16; r++ )
            {
              for( int c = 0; c < 16; c++ )
              {
                if( squares[ r ][ c ].isClicked == false )
                {
                  squares[ r ][ c ].update2();
                }
              }
            }
          }
          else if( squares[ row ][ col ].number == 0 )
          {
            recurse( row, col );
          }
        }
      }
    }
  }
  if( flag == true )
  {
    for( int row = 0; row < 16; row++ )
    {
      for( int col = 0; col < 16; col++ )
      {
        if( ( mouseX >= squares[ row ][ col ].xCor ) &&
            ( mouseY >= squares[ row ][ col ].yCor ) &&
            ( mouseX <= squares[ row ][ col ].xCor + 50 ) &&
            ( mouseY <= squares[ row ][ col ].yCor + 50 ) &&
            ( squares[ row ][ col ].isClicked == false ) )
        {
          if( squares[ row ][ col ].isFlagged == false )
          {
            squares[ row ][ col ].placeFlag();
          }
          else
          {
            rect( squares[ row ][ col ].xCor, squares[ row ][ col ].yCor, 50, 50 );
            squares[ row ][ col ].isFlagged = false;
          }
        }
      }
    }
  }
  reveal = false;
  flag = false;
}

public void recurse( int row, int col )
{
  if( squares[ row ][ col ].state == 1)
  {
    return;
  }
  else if( squares[ row ][ col ].number != 0 )
  {
    squares[ row ][ col ].update2();
    return;
  }
  else
  {
    for( int rowOffs = -1; rowOffs <= 1; rowOffs++ ) 
    {
      for( int colOffs = -1; colOffs <= 1; colOffs++ ) 
      {
        int posX = row + rowOffs;
        int posY = col + colOffs;
        if( posX != -1 && posY != -1 && posX != 16 && posY != 16 )
        {
          if( squares[ posX ][ posY ].isClicked == false )
          {
            squares[ posX ][ posY ].update2();
            recurse( posX, posY );
          }
        }
      }
    }
  }
}
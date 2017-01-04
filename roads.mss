// dummy styles to set ordering (case below fill)
#transportation {
  ::case { opacity: 1; }
  ::fill { opacity: 1; }
} 

// consistent case size
@case: 2;

// Road & Railway Fills //
#transportation[brunnel='tunnel'] { opacity: 0.5; }

#transportation[zoom<11] {
  line-color: @road;
  line-width: 0.25;
  [class='motorway'][zoom>=5],
  [class=~'trunk|primary|secondary|tertiary'][zoom>=6]{
    line-width: 0.5;
  }
  [class='motorway'][zoom>=6] { line-width: 1; }
}

#transportation::fill[zoom>=11]{
  ['mapnik::geometry_type'=2] {
    line-color: @road;
    line-width: 0.25;
    [zoom>=15] { line-width: 1; } 
    [class='path'] { line-dasharray: 2,2;}
    [class='railway'] { line-dasharray: 3,3; }
    [class='motorway'] { 
      [zoom>=11] { line-width: 2; }
      [zoom>=12] { line-width: 3; }
      [zoom>=14] { line-width: 4; }
      [zoom>=16] { line-width: 7; }
      [zoom>=18] { line-width: 10; }
    }
    [class='motorway'][ramp=1],
    [class='trunk|primary|secondary|tertiary'] {
      [zoom>=11] { line-width: 1; }
      [zoom>=12] { line-width: 2; }
      [zoom>=14] { line-width: 3; }
      [zoom>=16] { line-width: 5; }
      [zoom>=18] { line-width: 7; }
    }
    [class='minor'],
    [class='service'] {
      [zoom>=14] { line-width: 1; }
      [zoom>=16] { line-width: 2; }
      [zoom>=18] { line-width: 4; }
    }
  }
}

// Casing for high-zoom roads //
#transportation::case[zoom>=11] {
  ['mapnik::geometry_type'=2] {
    line-color: @land;
    line-width: 1;
    [class='motorway'][ramp=1] { 
      [zoom>=11] { line-width: 2 + @case; }
      [zoom>=12] { line-width: 3 + @case; }
      [zoom>=14] { line-width: 4 + @case; }
      [zoom>=16] { line-width: 7 + @case; }
      [zoom>=18] { line-width: 10 + @case; }
    }
     [class='motorway'][ramp=1] ,
    [class='trunk|primary|secondary|tertiary'] {
      [zoom>=11] { line-width: 1 + @case; }
      [zoom>=12] { line-width: 2 + @case; }
      [zoom>=14] { line-width: 3 + @case; }
      [zoom>=16] { line-width: 5 + @case; }
      [zoom>=18] { line-width: 7 + @case; }
    }
    [class='minor'],
    [class='service'] {
      [zoom>=14] { line-width: 1 + @case; }
      [zoom>=16] { line-width: 2 + @case; }
      [zoom>=18] { line-width: 4 + @case; }
    }
  }
}
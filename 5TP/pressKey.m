function x = pressKey(key,t)

  x = zeros(size(t));
  highFreq = [1209 1336 1477 1633 0];
  lowFreq  = [ 941  852  770  697 0];
  
  switch key
    case {"1" "2" "3" "A"}
      lowIndex=1;
    case {"4" "5" "6" "B"}
      lowIndex=2;
    case {"7" "8" "9" "C"}
      lowIndex=3;
    case {"*" "0" "#" "D"}
      lowIndex=4;
    otherwise
      lowIndex=5;
  endswitch
  
  switch key
    case {"1" "4" "7" "*"}
      highIndex=1;
    case {"2" "5" "8" "0"}
      highIndex=2;
    case {"3" "6" "9" "#"}
      highIndex=3;
    case {"A" "B" "C" "D"}
      highIndex=4;
    otherwise
      highIndex=5;
  endswitch

  x = sin(2*pi*highFreq(highIndex)*t)+sin(2*pi*lowFreq(lowIndex)*t);
 
 endfunction

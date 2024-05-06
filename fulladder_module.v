module fullAdder(x, y, cin, cout, sum);
  input  x, y , cin;
  output cout, sum;
  wire w1, w2, w3;
  
  and(w1, x, y);
  and(w2, x, cin);
  and(w3, y, cin);
  xor(sum, x, y, cin);
  or(cout, w1, w2, w3);
  
endmodule

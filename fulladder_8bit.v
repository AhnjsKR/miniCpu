module fullAdder_8bit(x, y, cin, cout, sum);
  input [7:0]x, y;
  input cin;
  output [7:0]sum;
  output cout;
  wire [6:0]c;
  
  fullAdder f1(.x(x[0]), .y(y[0]), .cin(cin), .cout(c[0]), .sum(sum[0]));
  fullAdder f2(.x(x[1]), .y(y[1]), .cin(c[0]), .cout(c[1]), .sum(sum[1]));
  fullAdder f3(.x(x[2]), .y(y[2]), .cin(c[1]), .cout(c[2]), .sum(sum[2]));
  fullAdder f4(.x(x[3]), .y(y[3]), .cin(c[2]), .cout(c[3]), .sum(sum[3]));
  fullAdder f5(.x(x[4]), .y(y[4]), .cin(c[3]), .cout(c[4]), .sum(sum[4]));
  fullAdder f6(.x(x[5]), .y(y[5]), .cin(c[4]), .cout(c[5]), .sum(sum[5]));
  fullAdder f7(.x(x[6]), .y(y[6]), .cin(c[5]), .cout(c[6]), .sum(sum[6]));
  fullAdder f8(.x(x[7]), .y(y[7]), .cin(c[6]), .cout(cout), .sum(sum[7]));
endmodule

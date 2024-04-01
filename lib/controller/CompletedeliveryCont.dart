class Orderlist{
  String code;
  String date;
  String amount;
  String status;
  Orderlist(
      this.code,
      this.date,
      this.amount,
      this.status,
      );
}
List<Orderlist> list = [
  Orderlist("123456", "07-05-2021", "₹200", "Cash on Delivery"),
  Orderlist("765433", "17-07-2021", "₹500", "Online"),
  Orderlist("334545", "27-08-2021", "₹300", "Cash on Delivery"),
  Orderlist("986555", "6-09-2021", "₹100", "Online"),
  Orderlist("876433", "12-05-2021", "₹700", "Online"),
];




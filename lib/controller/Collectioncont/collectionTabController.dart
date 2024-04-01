class CollectionTablist{
  String title;
  String Rupees;
  String date;
  CollectionTablist(this.title,this.Rupees,this.date);
}

List<CollectionTablist> listt = [
  CollectionTablist("Today", "₹1000", "5,Jan,24"),
  CollectionTablist("Yesterday", "₹2000", "4,Jan,24"),
  CollectionTablist("This Week", "₹20000", "30,Dec-5,Jan,24"),
  CollectionTablist("This Month", "₹34000", "30,Dec-5,Jan,24"),
  CollectionTablist("All", "₹60000","30,Dec-5,Jan,24"),
];
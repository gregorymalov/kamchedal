class FeedbackForm {
  String _name;
  String _mobileNo;
  String _feedback;
  String _waiter;
  double _rating;
  double _rating2;
  String _date;

  FeedbackForm(this._name, this._mobileNo, this._feedback, this._waiter, this._rating, this._rating2, this._date);

  // Method to make GET parameters.
  String toParams() => 
  "?name=$_name&mobileNo=$_mobileNo&feedback=$_feedback&waiter=$_waiter&rating=${_rating.floor()}&rating2=${_rating2.floor()}&date=$_date";
}
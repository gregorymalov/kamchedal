class FeedbackForm {
  String _name;
  String _mobileNo;
  String _feedback;
  double _rating;

  FeedbackForm(this._name, this._mobileNo, this._feedback, this._rating);

  // Method to make GET parameters.
  String toParams() => 
  "?name=$_name&mobileNo=$_mobileNo&feedback=$_feedback&rating=${_rating.floor()}";
}
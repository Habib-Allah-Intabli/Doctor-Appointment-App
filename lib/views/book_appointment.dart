// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:final_project/models/doctors_model.dart';
import 'package:final_project/views/doctor_details_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointment extends StatefulWidget {
  final DoctorsModel doctor;
  const BookAppointment({Key? key, required this.doctor}) : super(key: key);

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  List<String> times = [
    "09:00 AM",
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "3:00 PM",
    "3:30 PM",
    "4:00 PM",
    "4:30 PM",
    "5:00 PM",
    "5:30 PM",
  ];

  String? selectedTime;
  @override
  Widget build(BuildContext context) {
    TextEditingController datePickIt = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DoctorDetailsView(doctor: widget.doctor);
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xff374151),
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 50),
                  Text(
                    'Book Appointment',
                    style: TextStyle(
                      color: Color(0xff374151),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Select Date',
              style: TextStyle(
                color: Color(0xff1C2A3A),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 428.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffF9FAFB),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    color: Colors.black.withValues(alpha: 0.05),
                  ),
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: (selected, focused) {
                  setState(() {
                    selectedDay = selected;
                    focusedDay = focused;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: times.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                final time = times[index];
                final isSelected = selectedTime == time;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xff1C2A3A) : Color(0xffF9FAFB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(352, 39),
                  backgroundColor: Color(0xff1C2A3A),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: AlertDialog(
                          icon: CircleAvatar(
                            backgroundColor: Color(0xffA4CFC3),
                            radius: 55,
                            child: Icon(
                              Icons.verified_user,
                              size: 55,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            "Congratulations!",
                            style: TextStyle(
                              color: Color(0xff1C2A3A),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          content: Text(
                            'Your appointment with Dr. David Patel is confirmed for June 30, 2023, \nat 10:00 AM.',
                            style: TextStyle(
                              color: Color(0xff6B7280),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(245, 48),
                                  backgroundColor: Color(0xff1C2A3A),
                                ),
                                onPressed: () {
                                  print("the action done successfully");
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Done",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text("Confirm", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

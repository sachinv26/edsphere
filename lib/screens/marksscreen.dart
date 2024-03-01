import 'package:flutter/material.dart';
import 'package:schoolapp/core/app_export.dart';
import 'package:schoolapp/data/apiClient/getreport.dart';
import 'package:schoolapp/data/models/reportcard_model.dart';

class MarksScreen extends StatefulWidget {
  @override
  State<MarksScreen> createState() => _MarksScreenState();
}

class _MarksScreenState extends State<MarksScreen> {

  final ScrollController _firstController = ScrollController();
  List<List<MarksDetail>> allSubjectMarks = [];
  List<List<Note>> shownotes = [];
  List<String> examNames = [];
  List<int> maximarks = [];

  @override
  void dispose() {
    _firstController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    allSubjectMarks = List.from(Report.allSubjectMarks);
    examNames = List.from(Report.getExamNames());
    shownotes = List.from(Report.reviewnotes);
    maximarks = List.from(Report.getmaximarks());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: examNames.length,
      child: Scaffold(
        backgroundColor: Color(0xFFF2BA1B),
        appBar: AppBar(
          title: Text(
            'Exam Marks',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF0C1D3B),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.keyboard_backspace),
                color: Colors.white,
              );
            },
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blueGrey,
            tabs: examNames.map((examName) => Tab(text: examName)).toList(),
          ),
        ),
        body: TabBarView(
          children: examNames.asMap().entries.map((entry) {
            final examIndex = entry.key;
            final subjectMarks = allSubjectMarks[examIndex];
            final notes = shownotes[examIndex];
            return buildReportCardWidget(subjectMarks, notes, examIndex);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildReportCardWidget(
      List<MarksDetail> subjectMarks, List<Note> notes, int examIndex) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Subject',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Max Marks',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Marks',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Divider(color: Colors.black),
        Flexible(
          flex: 2,
          child: Scrollbar(
            controller: _firstController,
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 5,
            child: ListView.builder(
              itemCount: subjectMarks.length,
              itemBuilder: (context, index) {
                final MarksDetail marksDetail = subjectMarks[index];
                final String maxMarks = maximarks[examIndex].toString();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExamResultRow(
                      subject: marksDetail.subjectName,
                      maxMarks: maxMarks,
                      marks: marksDetail.marks.toString(),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Divider(color: Colors.black),
        Center(child: Text('Grades', style: TextStyle(fontSize: 20),)),
        Divider(color: Colors.black),
        SizedBox(height: 10.h),
        NoteListWidget(notes: notes),
      ],
    );
  }
}

class ColumnHeading extends StatelessWidget {
  final String text;

  ColumnHeading({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF0C1D3B),
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.white),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ExamResultRow extends StatelessWidget {
  final String subject;
  final String maxMarks;
  final String marks;

  ExamResultRow({
    required this.subject,
    required this.maxMarks,
    required this.marks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100.h,
              child: Center(
                child: Text(
                  subject,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  '${maxMarks.toString()}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Container(
              width: 100.h,
              child: Center(
                child: Text(
                  '${marks.toString()}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class NotesResultRow extends StatelessWidget {
  final String subject;
  final String maxMarks;
  final String marks;

  NotesResultRow({
    required this.subject,
    required this.maxMarks,
    required this.marks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100.h,
              child: Center(
                child: Text(
                  subject,
                  style: TextStyle(color: Colors.white, fontSize: 12.h),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  '${maxMarks.toString()}',
                  style: TextStyle(color: Colors.white, fontSize: 12.h),
                ),
              ),
            ),
            Container(
              width: 100.h,
              child: Center(
                child: Text(
                  '${marks.toString()}',
                  style: TextStyle(color: Colors.white, fontSize: 12.h),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NoteListWidget extends StatefulWidget {
  final List<Note> notes;

  NoteListWidget({required this.notes});

  @override
  State<NoteListWidget> createState() => _NoteListWidgetState();
}

class _NoteListWidgetState extends State<NoteListWidget> {
  final ScrollController _secondController = ScrollController();
  @override
  void dispose() {
    _secondController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Scrollbar(
        controller: _secondController,
        trackVisibility: true,
        thumbVisibility: true,
        child: ListView.builder(
          itemCount: widget.notes.length,
          itemBuilder: (context, index) {
            final Note note = widget.notes[index];
            return Card(
              margin: EdgeInsets.all(10),
              color: Color(0xFF0C1D3B),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NotesResultRow(
                      subject: note.note1,
                      maxMarks: note.note2,
                      marks: note.note3,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
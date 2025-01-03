import 'package:flexurio_chiron_ticket/src/app/model/ticket_comment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('TicketCommentText.fromJson', () {
    test('text unformatted', () {
      final data = {
        'id': '90030004491430',
        'comment': [
          {'text': 'apa ini?', 'attributes': <dynamic>{}},
          {
            'text': '\n',
            'attributes': {
              'block-id': 'block-72049fa4-a3e6-41d6-94dd-2dd3c2ac283d',
            },
          }
        ],
        'comment_text': 'apa ini?\n',
        'user': {
          'id': 3867844,
          'username': 'Nunung Pamungkas',
          'email': 'nunung.pamungkas@vneu.co.id',
          'color': '#7b68ee',
          'initials': 'NP',
          'profilePicture':
              'https://attachments.clickup.com/profilePictures/3867844_Vak.jpg',
        },
        'reactions': <dynamic>[],
        'date': '1674541083348',
      };
      final commentText = TicketComment.fromJson(data);
      expect(
        DateFormat().format(commentText.dateTime),
        'January 24, 2023 1:18:03 PM',
      );
      expect(commentText.userName, 'Nunung Pamungkas');
      expect(commentText.userNip, '3867844');
      expect(commentText.userDepartment, '');
      expect(commentText.type, CommentType.text);
      expect(commentText.content, 'apa ini?');
    });

    test('file .txt', () {
      final data = {
        'id': '90030004458005',
        'comment': [
          {
            'text': 'Mualip Suhal | 1801008 | VNEU | file',
            'attributes': <dynamic>{},
          },
          {
            'text': '\n',
            'attributes': {
              'block-id': 'block-f40a33b3-84de-4f1d-ad33-c27e7dc0a538',
            },
          },
          {
            'text': '--------------------------------------------------',
            'attributes': <dynamic>{},
          },
          {
            'text': '\n',
            'attributes': {
              'block-id': 'block-5d0bcf15-8cfd-4d41-9ac5-b0e29af21c89',
            },
          },
          {
            'text': 'ew0KICAgICJpZCI6ICI1ZTlkNTExNC00ZTJhLTQwNGYtYTI3Mi05ZDMxMT'
                'c1ODBkMjAudHh0IiwNCiAgICAidmVyc2lvbiI6ICIwIiwNCiAgICAiZGF0ZSI6'
                'IDE2NzQ1MjM3Njk3ODYsDQogICAgIm5hbWUiOiAiNDIwMTEwNTAzLWJveC50eH'
                'QiLA0KICAgICJ0aXRsZSI6ICI0MjAxMTA1MDMtYm94LnR4dCIsDQogICAgImV4'
                'dGVuc2lvbiI6ICJ0eHQiLA0KICAgICJzb3VyY2UiOiAxLA0KICAgICJ0aHVtYm'
                '5haWxfc21hbGwiOiBudWxsLA0KICAgICJ0aHVtYm5haWxfbWVkaXVtIjogbnVs'
                'bCwNCiAgICAidGh1bWJuYWlsX2xhcmdlIjogbnVsbCwNCiAgICAidXJsIjogIm'
                'h0dHBzOi8vdDM3NDE2MjkucC5jbGlja3VwLWF0dGFjaG1lbnRzLmNvbS90Mzc0'
                'MTYyOS81ZTlkNTExNC00ZTJhLTQwNGYtYTI3Mi05ZDMxMTc1ODBkMjAvNDIwMT'
                'EwNTAzLWJveC50eHQiLA0KICAgICJ1cmxfd19xdWVyeSI6ICJodHRwczovL3Qz'
                'NzQxNjI5LnAuY2xpY2t1cC1hdHRhY2htZW50cy5jb20vdDM3NDE2MjkvNWU5ZD'
                'UxMTQtNGUyYS00MDRmLWEyNzItOWQzMTE3NTgwZDIwLzQyMDExMDUwMy1ib3gu'
                'dHh0P3ZpZXc9b3BlbiIsDQogICAgInVybF93X2hvc3QiOiAiaHR0cHM6Ly90Mz'
                'c0MTYyOS5wLmNsaWNrdXAtYXR0YWNobWVudHMuY29tL3QzNzQxNjI5LzVlOWQ1'
                'MTE0LTRlMmEtNDA0Zi1hMjcyLTlkMzExNzU4MGQyMC80MjAxMTA1MDMtYm94Ln'
                'R4dCINCn0=',
            'attributes': <dynamic>{},
          },
          {
            'text': '\n',
            'attributes': {
              'block-id': 'block-d5fb02b8-0bda-464e-ac22-04f5a9fc9c1b',
            },
          }
        ],
        'comment_text': 'Mualip Suhal | 1801008 | VNEU | file\n'
            '--------------------------------------------------\n'
            'ew0KICAgICJpZCI6ICI1ZTlkNTExNC00ZTJhLTQwNGYtYTI3Mi05ZDMxMTc1ODBkMj'
            'AudHh0IiwNCiAgICAidmVyc2lvbiI6ICIwIiwNCiAgICAiZGF0ZSI6IDE2NzQ1MjM3'
            'Njk3ODYsDQogICAgIm5hbWUiOiAiNDIwMTEwNTAzLWJveC50eHQiLA0KICAgICJ0aX'
            'RsZSI6ICI0MjAxMTA1MDMtYm94LnR4dCIsDQogICAgImV4dGVuc2lvbiI6ICJ0eHQi'
            'LA0KICAgICJzb3VyY2UiOiAxLA0KICAgICJ0aHVtYm5haWxfc21hbGwiOiBudWxsLA'
            '0KICAgICJ0aHVtYm5haWxfbWVkaXVtIjogbnVsbCwNCiAgICAidGh1bWJuYWlsX2xh'
            'cmdlIjogbnVsbCwNCiAgICAidXJsIjogImh0dHBzOi8vdDM3NDE2MjkucC5jbGlja3'
            'VwLWF0dGFjaG1lbnRzLmNvbS90Mzc0MTYyOS81ZTlkNTExNC00ZTJhLTQwNGYtYTI3'
            'Mi05ZDMxMTc1ODBkMjAvNDIwMTEwNTAzLWJveC50eHQiLA0KICAgICJ1cmxfd19xdW'
            'VyeSI6ICJodHRwczovL3QzNzQxNjI5LnAuY2xpY2t1cC1hdHRhY2htZW50cy5jb20v'
            'dDM3NDE2MjkvNWU5ZDUxMTQtNGUyYS00MDRmLWEyNzItOWQzMTE3NTgwZDIwLzQyMD'
            'ExMDUwMy1ib3gudHh0P3ZpZXc9b3BlbiIsDQogICAgInVybF93X2hvc3QiOiAiaHR0'
            'cHM6Ly90Mzc0MTYyOS5wLmNsaWNrdXAtYXR0YWNobWVudHMuY29tL3QzNzQxNjI5Lz'
            'VlOWQ1MTE0LTRlMmEtNDA0Zi1hMjcyLTlkMzExNzU4MGQyMC80MjAxMTA1MDMtYm94'
            'LnR4dCINCn0=\n',
        'user': {
          'id': 3867844,
          'username': 'Nunung Pamungkas',
          'email': 'nunung.pamungkas@vneu.co.id',
          'color': '#7b68ee',
          'initials': 'NP',
          'profilePicture':
              'https://attachments.clickup.com/profilePictures/3867844_Vak.jpg',
        },
        'reactions': <dynamic>[],
        'date': '1674523906561',
      };
      final commentText = TicketComment.fromJson(data);
      expect(
        DateFormat().format(commentText.dateTime),
        'January 24, 2023 8:31:46 AM',
      );
      expect(commentText.userName, 'Mualip Suhal');
      expect(commentText.userNip, '1801008');
      expect(commentText.userDepartment, 'VNEU');
      expect(commentText.type, CommentType.file);
      expect(commentText.attachment!.name, '420110503-box.txt');
      expect(commentText.attachment!.extension, 'txt');
      expect(commentText.attachment!.thumbnail, isNull);
      expect(
        commentText.attachment!.url,
        'https://t3741629.p.clickup-attachments.com/t3741629/5e9d5114-4e2a-404f-a272-9d3117580d20/420110503-box.txt',
      );
      expect(
        commentText.attachment!.id,
        '5e9d5114-4e2a-404f-a272-9d3117580d20.txt',
      );
    });

    test('file .jpg', () {
      final data = {
        'id': '90030004462448',
        'comment': [
          {
            'text': 'Mualip Suhal | 1801008 | VNEU | file',
            'attributes': <dynamic>{},
          },
          {
            'text': '\n',
            'attributes': {
              'block-id': 'block-590754de-b137-4d76-bf05-f35df1882d3c',
            },
          },
          {
            'text': '--------------------------------------------------',
            'attributes': <dynamic>{},
          },
          {
            'text': '\n',
            'attributes': {
              'block-id': 'block-7dfb6f9a-3d55-490a-8111-6ebd68d51a43',
            },
          },
          {
            'text': 'ew0KICAgICJpZCI6ICI4NTA3YWEzZS03MjhhLTQ3NTItYTZiMy01ZDc1YT'
                'RhOTQ2MWQuanBnIiwNCiAgICAidmVyc2lvbiI6ICIwIiwNCiAgICAiZGF0ZSI6'
                'IDE2NzQ1MjYwOTA3MDAsDQogICAgIm5hbWUiOiAiZmFjZS5qcGciLA0KICAgIC'
                'J0aXRsZSI6ICJmYWNlLmpwZyIsDQogICAgImV4dGVuc2lvbiI6ICJqcGciLA0K'
                'ICAgICJzb3VyY2UiOiAxLA0KICAgICJ0aHVtYm5haWxfc21hbGwiOiAiaHR0cH'
                'M6Ly90Mzc0MTYyOS5wLmNsaWNrdXAtYXR0YWNobWVudHMuY29tL3QzNzQxNjI5'
                'Lzg1MDdhYTNlLTcyOGEtNDc1Mi1hNmIzLTVkNzVhNGE5NDYxZF9zbWFsbC5qcG'
                'ciLA0KICAgICJ0aHVtYm5haWxfbWVkaXVtIjogImh0dHBzOi8vdDM3NDE2Mjku'
                'cC5jbGlja3VwLWF0dGFjaG1lbnRzLmNvbS90Mzc0MTYyOS84NTA3YWEzZS03Mj'
                'hhLTQ3NTItYTZiMy01ZDc1YTRhOTQ2MWRfbWVkaXVtLmpwZyIsDQogICAgInRo'
                'dW1ibmFpbF9sYXJnZSI6ICJodHRwczovL3QzNzQxNjI5LnAuY2xpY2t1cC1hdH'
                'RhY2htZW50cy5jb20vdDM3NDE2MjkvODUwN2FhM2UtNzI4YS00NzUyLWE2YjMt'
                'NWQ3NWE0YTk0NjFkL2ZhY2UuanBnIiwNCiAgICAidXJsIjogImh0dHBzOi8vdD'
                'M3NDE2MjkucC5jbGlja3VwLWF0dGFjaG1lbnRzLmNvbS90Mzc0MTYyOS84NTA3'
                'YWEzZS03MjhhLTQ3NTItYTZiMy01ZDc1YTRhOTQ2MWQvZmFjZS5qcGciLA0KIC'
                'AgICJ1cmxfd19xdWVyeSI6ICJodHRwczovL3QzNzQxNjI5LnAuY2xpY2t1cC1h'
                'dHRhY2htZW50cy5jb20vdDM3NDE2MjkvODUwN2FhM2UtNzI4YS00NzUyLWE2Yj'
                'MtNWQ3NWE0YTk0NjFkL2ZhY2UuanBnP3ZpZXc9b3BlbiIsDQogICAgInVybF93'
                'X2hvc3QiOiAiaHR0cHM6Ly90Mzc0MTYyOS5wLmNsaWNrdXAtYXR0YWNobWVudH'
                'MuY29tL3QzNzQxNjI5Lzg1MDdhYTNlLTcyOGEtNDc1Mi1hNmIzLTVkNzVhNGE5'
                'NDYxZC9mYWNlLmpwZyINCn0=',
            'attributes': <dynamic>{},
          },
          {
            'text': '\n',
            'attributes': {
              'block-id': 'block-6859cc18-ecae-4360-8ad6-08b5f5e976be',
            },
          },
          {
            'text': '\n',
            'attributes': {
              'block-id': 'block-5b6a08ba-ef68-4491-945c-7bb2b34b8e23',
            },
          },
          {
            'text': '\n',
            'attributes': {
              'block-id': 'block-bb1f5f59-fb68-4516-94ab-ce2b1099b239',
            },
          }
        ],
        'comment_text': 'Mualip Suhal | 1801008 | VNEU | file\n'
            '--------------------------------------------------\n'
            'ew0KICAgICJpZCI6ICI4NTA3YWEzZS03MjhhLTQ3NTItYTZiMy01ZDc1YTRhOTQ2MW'
            'QuanBnIiwNCiAgICAidmVyc2lvbiI6ICIwIiwNCiAgICAiZGF0ZSI6IDE2NzQ1MjYw'
            'OTA3MDAsDQogICAgIm5hbWUiOiAiZmFjZS5qcGciLA0KICAgICJ0aXRsZSI6ICJmYW'
            'NlLmpwZyIsDQogICAgImV4dGVuc2lvbiI6ICJqcGciLA0KICAgICJzb3VyY2UiOiAx'
            'LA0KICAgICJ0aHVtYm5haWxfc21hbGwiOiAiaHR0cHM6Ly90Mzc0MTYyOS5wLmNsaW'
            'NrdXAtYXR0YWNobWVudHMuY29tL3QzNzQxNjI5Lzg1MDdhYTNlLTcyOGEtNDc1Mi1h'
            'NmIzLTVkNzVhNGE5NDYxZF9zbWFsbC5qcGciLA0KICAgICJ0aHVtYm5haWxfbWVkaX'
            'VtIjogImh0dHBzOi8vdDM3NDE2MjkucC5jbGlja3VwLWF0dGFjaG1lbnRzLmNvbS90'
            'Mzc0MTYyOS84NTA3YWEzZS03MjhhLTQ3NTItYTZiMy01ZDc1YTRhOTQ2MWRfbWVkaX'
            'VtLmpwZyIsDQogICAgInRodW1ibmFpbF9sYXJnZSI6ICJodHRwczovL3QzNzQxNjI5'
            'LnAuY2xpY2t1cC1hdHRhY2htZW50cy5jb20vdDM3NDE2MjkvODUwN2FhM2UtNzI4YS'
            '00NzUyLWE2YjMtNWQ3NWE0YTk0NjFkL2ZhY2UuanBnIiwNCiAgICAidXJsIjogImh0'
            'dHBzOi8vdDM3NDE2MjkucC5jbGlja3VwLWF0dGFjaG1lbnRzLmNvbS90Mzc0MTYyOS'
            '84NTA3YWEzZS03MjhhLTQ3NTItYTZiMy01ZDc1YTRhOTQ2MWQvZmFjZS5qcGciLA0K'
            'ICAgICJ1cmxfd19xdWVyeSI6ICJodHRwczovL3QzNzQxNjI5LnAuY2xpY2t1cC1hdH'
            'RhY2htZW50cy5jb20vdDM3NDE2MjkvODUwN2FhM2UtNzI4YS00NzUyLWE2YjMtNWQ3'
            'NWE0YTk0NjFkL2ZhY2UuanBnP3ZpZXc9b3BlbiIsDQogICAgInVybF93X2hvc3QiOi'
            'AiaHR0cHM6Ly90Mzc0MTYyOS5wLmNsaWNrdXAtYXR0YWNobWVudHMuY29tL3QzNzQx'
            'NjI5Lzg1MDdhYTNlLTcyOGEtNDc1Mi1hNmIzLTVkNzVhNGE5NDYxZC9mYWNlLmpwZy'
            'INCn0=\n\n\n',
        'user': {
          'id': 3867844,
          'username': 'Nunung Pamungkas',
          'email': 'nunung.pamungkas@vneu.co.id',
          'color': '#7b68ee',
          'initials': 'NP',
          'profilePicture':
              'https://attachments.clickup.com/profilePictures/3867844_Vak.jpg',
        },
        'reactions': <dynamic>[],
        'date': '1674526289538',
      };
      final commentText = TicketComment.fromJson(data);
      expect(
        DateFormat().format(commentText.dateTime),
        'January 24, 2023 9:11:29 AM',
      );
      expect(commentText.userName, 'Mualip Suhal');
      expect(commentText.userNip, '1801008');
      expect(commentText.userDepartment, 'VNEU');
      expect(commentText.type, CommentType.file);
      expect(commentText.attachment!.name, 'face.jpg');
      expect(commentText.attachment!.extension, 'jpg');
      expect(
        commentText.attachment!.thumbnail,
        'https://t3741629.p.clickup-attachments.com/t3741629/8507aa3e-728a-4752-a6b3-5d75a4a9461d_medium.jpg',
      );
      expect(
        commentText.attachment!.url,
        'https://t3741629.p.clickup-attachments.com/t3741629/8507aa3e-728a-4752-a6b3-5d75a4a9461d/face.jpg',
      );
      expect(
        commentText.attachment!.id,
        '8507aa3e-728a-4752-a6b3-5d75a4a9461d.jpg',
      );
    });
  });
}

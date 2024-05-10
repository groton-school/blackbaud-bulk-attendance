<?php

namespace GrotonSchool\Blackbaud\BulkAttendance;

use Blackbaud\SKY\School\Client;
use Blackbaud\SKY\School\Components\AttendanceCreate;
use GrotonSchool\Blackbaud\BulkAttendance\External\ListResult;
use Battis\LazySecrets\Cache;

class BulkAttendance
{
    private Client $school;

    /** @var Student[] $students */
    private array $students;

    public function __construct(Client $school)
    {
        $this->school = $school;
        $secrets = new Cache();
        $this->students = ListResult::from(
            $school->v1->lists->advanced->getByListId([
                'list_id' => $secrets->get('STUDENT_LIST_ID'),
            ])
        )->getAs(Student::class);
    }

    private function findStudentByEmail(string $email): ?Student
    {
        foreach ($this->students as $student) {
            if ($student->email == $email) {
                return $student;
            }
        }
        return null;
    }

    private function findStudentByHostId(string $hostId): ?Student
    {
        foreach ($this->students as $student) {
            if ($student->hostId == $hostId) {
                return $student;
            }
        }
        return null;
    }

    public function record(array $data)
    {
        if (count($data)) {
            $hostId = null;
            $email = null;
            $begin = null;
            $end = null;
            $excuseTypeId = null;
            $comment = null;

            $errors = [];

            $keys = array_keys($data[0]);
            foreach ($keys as $key) {
                switch (strtolower($key)) {
                    case 'host id':
                    case 'host_id':
                    case 'hostid':
                        $hostId = $key;
                        break;
                    case 'email':
                    case 'e-mail':
                        $email = $key;
                        break;
                    case 'begin':
                        $begin = $key;
                        break;
                    case 'end':
                        $end = $key;
                        break;
                    case 'excuse_type':
                    case 'excuse type':
                    case 'excuse_type_id':
                    case 'excuse type id':
                    case 'excuse':
                        $excuseTypeId = $key;
                        break;
                    case 'comment':
                        $comment = $key;
                        break;
                }
            }

            foreach ($data as $i => $row) {
                /** @var Student $student */
                $student = null;
                if (!empty($row[$hostId])) {
                    $student = $this->findStudentByHostId($row[$hostId]);
                } elseif (!empty($row[$email])) {
                    $student = $this->findStudentByEmail($row[$email]);
                }
                if (!empty($student)) {
                    $create = new AttendanceCreate([
                        'student_user_id' => $student->userId,
                        'begin_date' => $row[$begin],
                        'end_date' => $row[$end],
                        'start_time' => substr(
                            $row[$begin] ?? '',
                            strpos($row[$begin], ' ') + 1
                        ),
                        'end_time' => substr(
                            $row[$end] ?? '',
                            strpos($row[$end], ' ') + 1
                        ),
                        'excuse_type_id' => $row[$excuseTypeId],
                        'excuse_comment' => $row[$comment] ?? '',
                    ]);
                    $this->school->v1->attendance->post($create);
                } else {
                    $errors[] = "Student $i not found: " . json_encode($row);
                }
            }

            if (!empty($errors)) {
                throw new BulkAttendanceException(join(', ', $errors));
            }
        }
    }
}

<?php

namespace GrotonSchool\Blackbaud\BulkAttendance;

use GrotonSchool\Blackbaud\BulkAttendance\External\ListItem;

class Student implements ListItem
{
    public ?int $userId;
    public ?string $firstName;
    public ?string $lastName;
    public ?int $gradYear;
    public ?string $email;
    public ?string $hostId;
    public ?string $preferredName;
    public ?string $preferredOrFirstName;

    public function __construct(array $data)
    {
        $this->userId = $data['User ID'];
        $this->firstName = $data['First Name'];
        $this->lastName = $data['Last Name'];
        $this->gradYear = $data['Grad Year'];
        $this->email = $data['E-Mail'];
        $this->hostId = $data['Host ID'];
        $this->preferredName = $data['Preferred Name'];
        $this->preferredOrFirstName = $data['Preferred or First Name'];
    }
}

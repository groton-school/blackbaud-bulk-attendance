<?php

use Battis\DataUtilities\Arrays;
use Blackbaud\SKY\School\Client;
use GrotonSchool\Blackbaud\BulkAttendance\BulkAttendance;
use GrotonSchool\SKY\AppEngine\ClientFactory;
use Twig\Environment;
use Twig\Loader\FilesystemLoader;

$factory = new ClientFactory();

/** @var Client $school */
$school = $factory->get(Client::class);

$excuses = $school->v1->types->excusedtypes->list_();

$messages = [];

if (!empty($_FILES['csv'])) {
    try {
        $factory = new ClientFactory();
        $school = $factory->get(Client::class);
        $bulk = new BulkAttendance($school);

        foreach ($_FILES['csv']['error'] as $key => $error) {
            if ($error === UPLOAD_ERR_OK) {
                $data = Arrays::fromCSV($_FILES['csv']['tmp_name'][$key]);
                $bulk->record($data);
                $count = count($data);
                $messages[] = [
                    'level' => 'success',
                    'text' => "<strong>{$_FILES['csv']['name'][$key]}:</strong>, $count records created.",
                ];
            } else {
                $messages[] = [
                    'level' => 'danger',
                    'text' => "<strong>{$_FILES['csv']['name'][$key]}:</strong> upload error: <code>$error</code>",
                ];
            }
        }
    } catch (Exception $e) {
        $messages[] = [
            'text' =>
                '<h4>Error ' .
                $e->getCode() .
                '</h4><p>' .
                $e->getMessage() .
                '</p><pre>' .
                $e->getTraceAsString() .
                '</pre>',
            'level' => 'danger',
        ];
    }
}

$twig = new Environment(new FilesystemLoader(__DIR__ . '/../../templates'));
echo $twig->render(
    'form.html',
    array_merge(
        [
            'action' => $_SERVER['REQUEST_URI'],
            'messages' => $messages,
            'excuses' => json_decode(json_encode($excuses), true)['value'],
        ],
        $_POST
    )
);

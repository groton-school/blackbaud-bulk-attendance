<?php

namespace GrotonSchool\Blackbaud\BulkAttendance\External;

use Blackbaud\SKY\School\Components\ListResult as ComponentsListResult;

class ListResult extends ComponentsListResult
{
    public static function from(ComponentsListResult $base): ListResult
    {
        return new ListResult(json_decode(json_encode($base), true));
    }

    /**
     * @param class-string<ListItem> $type
     *
     * @return ListItem[]
     */
    function getAs(string $type): array
    {
        $result = [];
        foreach ($this->results->rows as $rawRow) {
            $data = [];
            foreach ($rawRow->columns as $column) {
                $data[$column->name] = $column->value;
            }
            $result[] = new $type($data);
        }
        return $result;
    }
}

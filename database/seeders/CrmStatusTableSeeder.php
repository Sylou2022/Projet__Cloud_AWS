<?php

namespace Database\Seeders;

use App\Models\CrmStatus;
use Illuminate\Database\Seeder;

class CrmStatusTableSeeder extends Seeder
{
    public function run()
    {
        $crmStatuses = [
            [
                'id'         => 1,
                'name'       => 'Lead',
                'created_at' => '2024-01-17 19:38:00',
                'updated_at' => '2024-01-17 19:38:00',
            ],
            [
                'id'         => 2,
                'name'       => 'Customer',
                'created_at' => '2024-01-17 19:38:00',
                'updated_at' => '2024-01-17 19:38:00',
            ],
            [
                'id'         => 3,
                'name'       => 'Partner',
                'created_at' => '2024-01-17 19:38:00',
                'updated_at' => '2024-01-17 19:38:00',
            ],
        ];

        CrmStatus::insert($crmStatuses);
    }
}

inch
====

A simple library that lets you manipulate fractional inches e.g. 5 1/4 + 1/8

## Usage

Place inch.rb in rails_app_path/lib and 'require "inch"'

- `"5 1/4".to_inch + "1/8".to_inch`
- `=> "5 3/8"`

Try addittion (+), subtraction (-), multiplication (*), and division (/)

Convert inches to millimeters

- `"7 1/8".to_inch.to_mm`
- `=> 180.98`

Convert millimeters to inches

- `Inch.mm_to_inch(510)`
- `=> "20 1/16"`

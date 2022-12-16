open OUnit2
open Aoc_04.Lib

let test1 _ctx = assert_equal true (SectionAssignments.has_full_overlap (2,8) (3,7))
let test2 _ctx = assert_equal true (SectionAssignments.has_full_overlap (3,7) (2,8))
let test3 _ctx = assert_equal false (SectionAssignments.has_full_overlap (1,6) (4,7))


let suite =
"suite">:::
 ["test1">:: test1;
 "test2">:: test2;
 "test3">:: test3;
 ]
;;

let () =
  run_test_tt_main suite
;;

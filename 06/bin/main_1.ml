open Core

module Datastream = struct
  let is_start_marker chars =
    not (List.contains_dup chars ~compare: compare_char)

  let rec find_start_marker ?(pos = 0) stream =
    match stream with
    | (a :: b :: c :: d :: _rest) when is_start_marker [a;b;c;d] -> pos + 4, String.of_char_list [a;b;c;d]
    | (_ :: rest) -> find_start_marker rest ~pos: (pos + 1)
    | _ -> failwith "input exhausted"
end

module Input = struct
  let parse file =
    file
    |> In_channel.read_lines
    |> Fn.flip List.nth_exn 0
    |> String.to_list
end

let () =
  Input.parse "input"
  |> Datastream.find_start_marker
  |> fun (pos, marker) -> printf "%d %s\n" pos marker

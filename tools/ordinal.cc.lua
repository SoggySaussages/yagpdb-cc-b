{{- /*
	This command is a demonstration of adding the ordinal to a number. 1 -> 1st, 11 -> 11th, 122 -> 122nd.
	Usage: `-ordinal <number>`.

	Recommended trigger: Regex trigger with trigger `^-(ordinal|ord)`
*/ -}}

{{ with reFind `\d+` .StrippedMsg }}
	{{ $ord := "th" }}
	{{ $int := toInt . }}
	{{ $cent := toInt (mod $int 100) }}
	{{ $dec := toInt (mod $int 10) }}
	{{ if not (and (ge $cent 10) (le $cent 19)) }}
		{{ if eq $dec 1 }} {{ $ord = "st" }}
		{{ else if eq $dec 2 }} {{ $ord = "nd" }}
		{{ else if eq $dec 3 }} {{ $ord = "rd" }}
		{{ end }}
	{{ end }}
	❯ **Ordinal**
	`{{ . }}{{ $ord }}`
{{ end }}
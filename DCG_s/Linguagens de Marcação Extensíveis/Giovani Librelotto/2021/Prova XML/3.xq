(: {"language":"XQuery1","where":"CurrentFile"} :)
<Museu>
{for $p in pma_xml_export/database/*
return element {string($p/@*)} {
	for $o in $p/*
	return element {string($o/@*)} {
		if($o/text() = "NULL")
		then ""
		else $o/text()
	}
}}
</Museu>

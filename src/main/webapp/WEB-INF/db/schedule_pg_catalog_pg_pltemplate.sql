INSERT INTO pg_catalog.pg_pltemplate (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl) VALUES ('plpgsql', true, true, 'plpgsql_call_handler', 'plpgsql_inline_handler', 'plpgsql_validator', '$libdir/plpgsql', null);
INSERT INTO pg_catalog.pg_pltemplate (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl) VALUES ('pltcl', true, true, 'pltcl_call_handler', null, null, '$libdir/pltcl', null);
INSERT INTO pg_catalog.pg_pltemplate (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl) VALUES ('pltclu', false, false, 'pltclu_call_handler', null, null, '$libdir/pltcl', null);
INSERT INTO pg_catalog.pg_pltemplate (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl) VALUES ('plperl', true, true, 'plperl_call_handler', 'plperl_inline_handler', 'plperl_validator', '$libdir/plperl', null);
INSERT INTO pg_catalog.pg_pltemplate (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl) VALUES ('plperlu', false, false, 'plperlu_call_handler', 'plperlu_inline_handler', 'plperlu_validator', '$libdir/plperl', null);
INSERT INTO pg_catalog.pg_pltemplate (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl) VALUES ('plpythonu', false, false, 'plpython_call_handler', 'plpython_inline_handler', 'plpython_validator', '$libdir/plpython2', null);
INSERT INTO pg_catalog.pg_pltemplate (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl) VALUES ('plpython2u', false, false, 'plpython2_call_handler', 'plpython2_inline_handler', 'plpython2_validator', '$libdir/plpython2', null);
INSERT INTO pg_catalog.pg_pltemplate (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl) VALUES ('plpython3u', false, false, 'plpython3_call_handler', 'plpython3_inline_handler', 'plpython3_validator', '$libdir/plpython3', null);
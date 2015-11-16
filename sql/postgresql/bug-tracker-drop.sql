

-- Delete all bt_bug instances
create or replace function inline_0 ()
returns integer as $$
declare
	v_count	integer;
	row	record;
begin
	FOR row IN
		select	*
		from	acs_objects
		where	object_type = 'bt_bug'
	LOOP
		PERFORM bt_bug__delete(row.object_id);
	END LOOP;
	RETURN 0;
end;$$ language 'plpgsql';
select inline_0 ();
drop function inline_0 ();



drop table bt_user_prefs;
drop table bt_bugs;


-- Delete the entire object type
--
delete from acs_object_context_index where object_id in (select object_id from acs_objects where object_type = 'bt_bug');
delete from acs_object_context_index where ancestor_id in (select object_id from acs_objects where object_type = 'bt_bug');
update acs_objects set context_id = null where context_id in (select object_id from acs_objects where object_type = 'bt_bug');
delete from cr_item_keyword_map where item_id in (select object_id from acs_objects where object_type = 'bt_bug');
delete from workflow_case_log where entry_id in (select object_id from acs_objects where object_type = 'bt_bug');
delete from acs_object_type_tables where object_type = 'bt_bug';
delete from acs_objects where object_type = 'bt_bug';
select acs_object_type__drop_type('bt_bug', 't');



-- Delete the entire object type
--
delete from acs_object_type_tables where object_type = 'bt_bug_revision';
select content_type__drop_type('bt_bug_revision', 't', 'f');



drop table bt_bug_revisions;
drop table bt_default_keywords;
drop table bt_components cascade;
drop table bt_versions cascade;
drop table bt_projects cascade;
drop table bt_patch_bug_map;

-- Just a spelling mistake during development?
drop table btbug_revisions;


drop function bt_patch__delete(integer);
drop function bt_patch__name(integer);
drop function bt_patch__new(integer,integer,integer,text,text,text,text,integer,integer,varchar);
drop table bt_patch_actions;
drop table bt_patches;
drop sequence t_bt_patch_number_seq;
drop view bt_patch_number_seq;














drop function bt_bug__new(integer, integer, integer, integer, integer, character varying, character varying, text, 
character varying, timestamp with time zone, integer, character varying, integer, character varying, character varying);

drop function bt_bug__new(integer, integer, integer, integer, integer, character varying, character varying, text, 
character varying, timestamp with time zone, integer, character varying, integer, character varying, character varying, integer);

drop function bt_bug__new(
    integer,     -- bug_id
    integer,     -- package_id
    integer,     -- component_id
    integer,     -- found_in_version
    varchar,     -- summary
    varchar,     -- user_agent
    text,	-- comment_content
    varchar,     -- comment_format
    timestamptz, -- creation_date
    integer,     -- creation_user
    varchar,     -- creation_ip
    varchar,     -- item_subtype
    varchar      -- content_type
);

drop function bt_bug__delete (integer);

drop function bt_bug_revision__new(
integer, integer, integer, integer, integer, integer, character varying, character varying, 
character varying, timestamp with time zone, integer, character varying 
);

drop function bt_bug_revision__new(
integer, integer, integer, integer, integer, integer, character varying, character varying, 
character varying, timestamp with time zone, integer, character varying, integer
);


drop function bt_bug_revision__new(
    integer,	-- revision_id
    integer,	-- bug_id
    integer,	-- component_id
    integer,	-- found_in_version
    integer,	-- fix_for_version
    integer,	-- fixed_in_version
    varchar,	-- resolution
    varchar,	-- user_agent
    varchar,	-- summary
    timestamp,      -- creation_date
    integer,	-- creation_user
    varchar	 -- creation_ip
);

drop function bt_version__set_active (integer);
drop function bt_project__new(integer);
drop function bt_project__delete(integer);

drop function bt_project__keywords_delete(integer, boolean);

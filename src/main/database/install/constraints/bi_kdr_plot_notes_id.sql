create or replace trigger bi_kdr_plot_notes_id
  before insert on kdr_plot_notes
  for each row
begin
  if :new.note_id is null then
    select kdr_plot_notes_seq.nextval into :new.note_id from sys.dual;
  end if;
end;
/
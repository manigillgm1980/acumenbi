{% macro log_model_run(model_name, action) %}
  {% if action == 'start' %}
    {% set sql %}
      INSERT INTO ACUMENBI.PUBLIC.LOGRUNS (model_name, start_time, endtime)
      VALUES ('{{ model_name }}', CURRENT_TIMESTAMP(), NULL);
    {% endset %}
    {% do run_query(sql) %}
  {% elif action == 'end' %}
    {% set sql %}
      UPDATE ACUMENBI.PUBLIC.LOGRUNS
      SET endtime = CURRENT_TIMESTAMP()
      WHERE model_name = '{{ model_name }}'
      AND start_time = (SELECT MAX(start_time) FROM ACUMENBI.PUBLIC.LOGRUNS WHERE model_name = '{{ model_name }}' AND endtime IS NULL);
    {% endset %}
    {% do run_query(sql) %}
  {% endif %}
{% endmacro %}
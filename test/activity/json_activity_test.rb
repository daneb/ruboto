activity org.ruboto.test_app.JsonActivity

setup do |activity|
  start = Time.now
  loop do
    @text_view = activity.findViewById(42)
    break if @text_view || (Time.now - start > 60)
    sleep 1
  end
  assert @text_view
end

test('json encode decode') do |activity|
  assert_equal 'foo', activity.find_view_by_id(42).text.to_s
  assert_equal '["foo"]', activity.find_view_by_id(43).text.to_s
  assert_equal '"foo"', activity.find_view_by_id(44).text.to_s
end

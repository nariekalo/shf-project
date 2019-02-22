require 'rails_helper'


RSpec.describe SchemaDotOrg::Organization, type: :model do

  let(:item) {
    o               = described_class.new
    o.name          = 'org1'
    o.description   = 'description1'
    o.url           = 'https:/org1/'
    o.email         = 'org1@example.com'
    o.memberOf      = 'Sverigeshundföretagare'
    o.knowsLanguage = 'sv-SE'
    o.telephone     = '134 948494 01'
    o.location      = '12345 TBD Address'
    o.image = 'https://example.com/some-image.jpg'
    o
  }


  it '_to_json_struct' do
    expect(item._to_json_struct).to eq({
                                          "description"=>"description1",
                                          "email"=>"org1@example.com",
                                          "image"=>"https://example.com/some-image.jpg",
                                          "memberOf"=>"Sverigeshundföretagare",
                                          "knowsLanguage" => "sv-SE",
                                          "location" => "12345 TBD Address",
                                          "name"=>"org1",
                                          "telephone"=>"134 948494 01",
                                          "url"=>"https:/org1/"
                                      })
  end

  it 'to_json_ld' do
    expect(item.to_json_ld).to eq "<script type=\"application/ld+json\">\n{\"@context\":\"http://schema.org\"," +
                                     "\"@type\":\"Organization\"," +
                                     "\"@id\":\"https:/org1/\"," +
                                     "\"name\":\"org1\"," +
                                     "\"description\":\"description1\"," +
                                     "\"url\":\"https:/org1/\"," +
                                     "\"email\":\"org1@example.com\"," +
                                     "\"memberOf\":\"Sverigeshundföretagare\"," +
                                     "\"knowsLanguage\":\"sv-SE\"," +
                                     "\"telephone\":\"134 948494 01\"," +
                                     "\"location\":\"12345 TBD Address\"," +
                                     "\"image\":\"https://example.com/some-image.jpg\"" +
                                     "}\n</script>"
  end

end
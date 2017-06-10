FactoryGirl.define do
  factory :ecm_downloads_download, class: Ecm::Downloads::Download do
    sequence(:name) { |i| "Download ##{i}" }
    association :download_category, factory: :ecm_downloads_download_category
    asset { File.open(Ecm::Downloads::Engine.root.join(*%w(spec files ecm downloads download asset.txt))) }
  end
end

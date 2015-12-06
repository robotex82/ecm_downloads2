require 'rails_helper'

module Ecm
  module Downloads
    describe DownloadCategory do
      subject { FactoryGirl.build(:ecm_downloads_download_category) }

      it { should have_many(:ecm_downloads_downloads) }
      it { should respond_to :human }
      it { should respond_to :root }

      it 'should require a locale if it is a root node' do
        download_category = FactoryGirl.create(:ecm_downloads_download_category)
        download_category.should be_root

        download_category.locale = nil
        download_category.should_not be_valid
      end

      it 'should not accept a locale if it is not a root node' do
        download_category = FactoryGirl.create(:ecm_downloads_download_category_with_parent)
        download_category.should_not be_root

        download_category.locale = I18n.locale
        download_category.should_not be_valid
      end

      it 'should only accept available locales' do
        download_category = FactoryGirl.build(:ecm_downloads_download_category, locale: 'invalid')
        download_category.should_not be_valid
      end

      it 'should have a friendly id' do
        download_category = FactoryGirl.create(:ecm_downloads_download_category, name: 'Look, a slugged category!')
        download_category.to_param.should == 'look-a-slugged-category'
      end

      describe '#ecm_downloads_downloads_count' do
        it { should respond_to :ecm_downloads_downloads_count }
        it { expect(subject.ecm_downloads_downloads_count).to eq(0) }

        describe 'adding a download' do
          before(:each) do
            @download_category = create(:ecm_downloads_download_category)
            @download = create(:ecm_downloads_download, ecm_downloads_download_category: @download_category)
          end

          it { expect(@download_category.ecm_downloads_downloads_count).to eq(1) }
        end

        describe 'removing a download' do
          before(:each) do
            @download_category = create(:ecm_downloads_download_category)
            @download = create(:ecm_downloads_download, ecm_downloads_download_category: @download_category)
          end

          it { expect { @download.destroy; @download_category.reload }.to change { @download_category.ecm_downloads_downloads_count }.from(1).to(0) }
        end

        describe 'moving a download to another category' do
          before(:each) do
            @download_category = create(:ecm_downloads_download_category)
            @download = create(:ecm_downloads_download, ecm_downloads_download_category: @download_category)
            @other_category = create(:ecm_downloads_download_category)
          end

          it do
            expect do
              @download.ecm_downloads_download_category = @other_category
              @download.save
              @download_category.reload
            end.to change {
              @download_category.ecm_downloads_downloads_count
            }.from(1).to(0)
          end
        end
      end
    end
  end
end

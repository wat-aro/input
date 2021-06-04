RSpec.describe '/repos/{owner}/{repo}/pulls/{pull_number}/reviews' do
  describe 'POST /repos/{owner}/{repo}/pulls/{pull_number}/reviews' do
    let(:repo) { create(:repository, :with_owner) }
    let(:pull) { create(:pull_request, repository: repo) }
    let(:commit_id) { OpenSSL::Digest.hexdigest('SHA256', 'commit_id') }

    specify do
      params = {
        commit_id: commit_id,
        body: 'New Comment',
        event: 'COMMENT',
        comments: [
          {
            path: 'spec/requests/repos/owner/repo/pulls/reviews_spec.rb',
            line: 1,
            body: 'Use frozen string literal comment'
          },
          {
            path: 'spec/requests/repos/owner/repo/pulls/reviews_spec.rb',
            line: 1,
            body: "Add `require 'rails_helper'"
          }
        ]
      }
      post "/repos/#{repo.owner.name}/#{repo.name}/pulls/#{pull.number}/reviews", params: params

      expect(response).to have_http_status(:ok)
    end

    context 'event が COMMENT で body が空の場合' do
      it 'validation failed なレスポンスを返すこと' do
        params = { commit_id: commit_id, event: 'COMMENT', body: nil }
        post "/repos/#{repo.owner.name}/#{repo.name}/pulls/#{pull.number}/reviews", params: params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to eq ['本文を入力してください']
      end
    end

    context 'event が REQUEST_CHANGES で body が空の場合' do
      it 'validation failed なレスポンスを返すこと' do
        params = { commit_id: commit_id, event: 'REQUEST_CHANGES', body: nil }
        post "/repos/#{repo.owner.name}/#{repo.name}/pulls/#{pull.number}/reviews", params: params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to eq ['本文を入力してください']
      end
    end

    context 'event が APPROVE で body が空の場合' do
      it 'validation failed なレスポンスを返すこと' do
        params = { commit_id: commit_id, event: 'APPROVE', body: nil }
        post "/repos/#{repo.owner.name}/#{repo.name}/pulls/#{pull.number}/reviews", params: params

        expect(response).to have_http_status(:ok)
      end
    end

    context 'comment に body がない場合' do
      it 'validation failed なレスポンスを返すこと' do
        params = { commit_id: commit_id, body: 'body', comments: [{ path: 'spec/requests/repos/owner/repo/pulls/reviews_spec.rb', line: 1 }] }
        post "/repos/#{repo.owner.name}/#{repo.name}/pulls/#{pull.number}/reviews", params: params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to eq ['コメントの本文を入力してください']
      end
    end
  end
end

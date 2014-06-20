require_relative '../lib/harvest_timetrap_formatter/output'

describe 'HarvestOutput' do
  it 'prints out submitted entries' do
    results = { submitted: [{ notes: 'doing some work @code' }] }

    output = HarvestOutput.new(results)

    expect(output.generate).to include('Submitted: 1')
    expect(output.generate).to include('Submitted: doing some work @code')
  end

  it 'prints out failed submissions' do
    results = { failed: [{
      note: 'doing some work @unknown',
      error: "Unknown alias 'unknown'"
    }] }

    output = HarvestOutput.new(results)

    expect(output.generate).to include('Failed: 1')
    expect(output.generate).to include(
      "Failed (Unknown alias 'unknown'): doing some work @unknown"
    )
  end
end
